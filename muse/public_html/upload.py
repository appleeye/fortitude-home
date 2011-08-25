#!/usr/bin/python

# date:2011/08/25
# author:fortitude.zhang@gmail.com
# description:this files is used for upload my website files to the remote ftp server

from ftplib import FTP
import os
import sys

def main():
    """entry point"""

    # parse the args and decide what to upload
    if len(sys.argv) > 1:
        action = sys.argv[1]
    else:
        action = 'all'

    # print the help if user supply it
    if action == 'help':
        print "upload.py --- upload all files"
        print "upload.py html --- upload html files only"
        print "upload.py css --- upload css files only"
        print "upload.py image --- upload image files only"
        return
    
    # set up ftp environment
    try:
        ftp = FTP()
        ftp.set_debuglevel(2)
        ftp.connect('www.4nian.com', '21')
        ftp.login('asnoka', '19851007')
    except:
        print 'connect and login failed,quit the uploading'
        exit

    ftp.sendcmd('PASV')
    print ftp.getwelcome()
    
    print 'begin to do uploading'
    

    # get cwd
    cwd = os.getcwd()

    # upload html files under root directory
    if action == 'all' or action == 'html':
        ftp.cwd('/public_html/zdy')

        for fl in ftp.nlst():
            if len(fl) > 5 and fl[-5:] == '.html':
                delcmd = 'DELE %s' % fl
                print 'send del cmd %s' % delcmd
                ftp.sendcmd(delcmd)

        for fl in os.listdir('.'):
            if len(fl) > 5 and fl[-5:] == '.html':
                flhandle = open(fl, "rb")
                ftp.sendcmd('PASV')
                storcmd = 'STOR ' + fl
                ftp.storbinary(storcmd, flhandle, 1024)

    # upload css files
    if action == 'all' or action == 'css':
        ftp.cwd('/public_html/zdy/css')
        
        for fl in ftp.nlst():
            if len(fl) > 4 and fl[-4:] == '.css':
                delcmd = 'DELE %s' % fl
                print 'send del cmd %s' % delcmd
                ftp.sendcmd(delcmd)

        os.chdir(cwd + '/css')

        for fl in os.listdir('.'):
            if len(fl) > 4 and fl[-4:] == '.css':
                flhandle = open(fl, "rb")
                ftp.sendcmd('PASV')
                storcmd = 'STOR ' + fl
                ftp.storbinary(storcmd, flhandle, 1024)

    # upload image files
    if action == 'all' or action == 'image':
        ftp.cwd('/public_html/zdy/image')

        for fl in ftp.nlst():
            if len(fl) > 4 and (fl[-4:] == '.jpg' or fl[-4:] == '.png'):
                delcmd = 'DELE %s' % fl
                print 'send del cmd %s' % delcmd
                ftp.sendcmd(delcmd)

        os.chdir(cwd + '/image')

        for fl in os.listdir('.'):
            if len(fl) > 4 and (fl[-4:] == '.jpg' or fl[-4:] == '.png'):
                flhandle = open(fl, "rb")
                ftp.sendcmd('PASV')
                storcmd = 'STOR ' + fl
                ftp.storbinary(storcmd, flhandle, 1024)

    ftp.quit()

if __name__ == "__main__":
    main()
