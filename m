Return-Path: <hppa-linux@puffingroup.com>
Message-ID: <31AC914701CCD111900700805FE655DBCD1F66@xch-mes-02.msc.az.boeing.com>
From: "Werzyn, Ed" <Ed.Werzyn@ARZ.Boeing.com>
To: "'hppa-linux@puffingroup.com'" <hppa-linux@puffingroup.com>
Date: Wed, 10 Feb 1999 14:45:44 -0700
MIME-Version: 1.0
Content-Type: text/plain
Subject: [hppa-linux] Cannot get into multi-user mode on bootup
Resent-Message-ID: <"fF7lu.0.0k2.IZXms"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Howdy,

We have just thrown our hat into the ring on the HP PA-RISC Linux port.
Myself and Greg Zimmerman have installed the HP port of MkLinux on an HP
712/80 with a 2Gb drive and 96 Mb memory.  So add that to the list.

A problem that we are having though is when we boot the system, it gets to
the logon: prompt and two seconds later we get "Sending a kill signal to all
processes.  Going to single user mode" and dumps us back at the bash:#
prompt in single user mode.  Any ideas??

Also, the one problem that we had to overcome in the loading instructions is
after dd'ing the binary to the disk for the first time and booting it, we
had to edit the /etc/fstab file and remove the entries for /dev/sdg4 /var
and /dev/sdg5 /usr.  After rebooting we did the mkfs for /var and /usr.
Someone may want to update the loading instructions to point this out.
Note: originally we were getting bad Magic Number in the Superblock, but we
could not run e2fsck on the two filesystems since they were mounted as the
loading instructions suggested.

What's the current status of the porting?  Is the wish list on the
http://www.gr.osf.org/mklinux/hppa/mkpa.html web page still valid?

Thanks!!


Ed Werzyn
System Administrator
Longbow Apache Helicopter Software
Boeing - Mesa

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
