import re
import paramiko
import requests
flag = True
def extract_power_info(path):
    with open(path, 'r') as file:
        text = file.read()
    pattern = r'\| (.+?) \| +(\S+) +\| +(\S+) +\| +(\S+) +\| +(\S+) +\|'
    power_pattern = r"Total\s+\|\s+(\d+\.\d+)"
    # 使用正则表达式匹配并提取表格内容
    matches = re.findall(pattern, text)
    power_match = re.findall(power_pattern, text)
    total_power = float(power_match[0])
    # 将提取的内容转换为字典列表
    table_data = []
    for match in matches:
        category, power, used, available, utilization = match
        data = {
            'category': category,
            'Power (W)':  float(power) if  "<" not in power else "<0.001",
            'Used': float(used),
            'Available': float(available) if available != '---' else None,
            'Utilization (%)': float(utilization) if utilization != '---' and "<" not in utilization else None
        }
        table_data.append(data)
    resource = {"LUT":0, "FF":0, "BRAM":0}
    for data in table_data:
        if "LUT" in data['category']:
            resource["LUT"] += data['Used']
        elif "Register" in data['category']:
            resource["FF"] += data['Used']
        elif "Block RAM" in data['category']:
            resource["BRAM"] += data['Used']
    return total_power, resource

def execute_remote_command():
    local_path = '/Users/renyinghao/Project/veriloggen/'
    local_file_path = local_path+'/post_synth_power.rpt'  # 本地文件保存路径
    # 远程服务器的IP地址和SSH端口
    if flag:
        host = '133.11.14.21'
        port = 22

        # SSH连接的用户名和密码
        username = 'ren'
        password = 'PH-i3=wkHFVncZlg'
        home_path = '/home/ren/Projects/verilog_project/'
        
        # # 本地文件路径和远程目标路径
        local_file = local_path+'tmp.v'
        remote_file = home_path+'tmp.v'

        with open(local_file, 'r') as file:
            source_code = file.read()

        pattern = r'module test\n\(([\w\W]*?)endmodule'
        replaced_text = re.sub(pattern, "", source_code)
        with open(local_file, 'w') as file:
            file.write(replaced_text)

        output_dir = './output/outputfile'
        # SSH连接
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host, port, username, password)

        # 上传文件
        sftp = ssh.open_sftp()
        sftp.put(local_file, remote_file)
        device_name = 'xc7vx485tffg1157-1' #xc7a35ticsg324-1L
        # # 执行命令
        commands = [
            'cd '+home_path,
            'pwd',
            'set outputDir '+output_dir,
            'mkdir -p $outputDir',
            'read_verilog tmp.v',
            'synth_design -part '+device_name+' -top blinkled',
            'write_checkpoint -force $outputDir/post_synth',
            'report_power -file $outputDir/post_synth_power.rpt'
        ]
        
        channel = ssh.invoke_shell()
        channel.send('vivado -mode tcl\n')

        output = ''
        while True:
            # 读取Tcl Shell的输出
            data = channel.recv(1024).decode('utf-8')
            output += data
            if 'Vivado%' in data:
                break

        for command in commands:
            print("exe:"+command)
            channel.send(command + '\n')
            
            output = ''
            while True:
                data = channel.recv(1024).decode('utf-8')
                output += data
                print(output)
                if 'Vivado%' in data:
                    break
            # print(output)
            # 在output中检查成功提示信息或关键词
            if 'ERROR' in output:
                print(f"指令执行失败: {command}")
            else:
                print(f"指令执行成功: {command}")

        # 读取 power report 文件

        # ssh.close()
        
        url = home_path+output_dir+'/post_synth_power.rpt'
        

        sftp.get(url, local_file_path)
        sftp.close()
        ssh.close()
    power, resource = extract_power_info(local_file_path)
    return power, resource

# 调用函数并获取结果
power, resource = execute_remote_command()


print(power)
print(resource)
