Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from picard.corpconnect.com.au (picard.corpconnect.com.au [203.34.58.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28A77482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 May 2002 02:38:04 -0600 (MDT)
Received: from klingon.corpconnect.com.au (ppro.corpconnect.com.au [203.34.58.17])
	by picard.corpconnect.com.au (8.8.7/8.8.7) with ESMTP id SAA29996
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 May 2002 18:38:02 +1000
Message-Id: <5.1.0.14.2.20020515180607.04cd8790@pop01.corpconnect.com.au>
Date: Wed, 15 May 2002 18:27:09 +1000
To: parisc-linux@lists.parisc-linux.org
From: Richard Muratti <rmurat@attglobal.net>
Subject: Re: [parisc-linux] Re: tftp boot
In-Reply-To: <1021446513.3ce20971163e7@webmail.tiscali.be>
References: <5.1.0.14.2.20020515114933.04d138b8@pop01.corpconnect.com.au>
 <002501c1fb5b$48459540$02c1a8c0@james.co.uk>
 <002501c1fb5b$48459540$02c1a8c0@james.co.uk>
 <5.1.0.14.2.20020515114933.04d138b8@pop01.corpconnect.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Joel,

hear's my setup

/etc/inetd.conf
tftp    dgram   udp     wait    root    /usr/sbin/tcpd  in.tftpd
bootps  dgram   udp     wait    root    /usr/sbin/tcpd  bootpd -d 4

/etc/bootptab
c3000:hd=/tftpboot:bf=lifimage:ht=ether:ha=xxxxxxxx7368:sm=255.255.255.0:hn:ip=xxx.xx.xx.10:vm=rfc1048
alpha:hd=/tftpboot:bf=tftpboot.img:ht=ether:ha=xxxxxxxx33f6:sm=255.255.255.0:hn:ip=xxx.xx.xx.9:vm=rfc1048

/etc/exports
/tftpboot/c3000 c3000(rw,no_root_squash)

/etc/hosts
xxx.xx.xx.10    c3000   c3000

You must add you host to the hosts file for nfs export to work

ls tftpboot
System.map-20010115            lifimage 
nfsroot-20001009.tar.gz  vmlinux-20010201
System.map-32-serial-20010418  lifimage-20010115            tftpboot.img 
          vmlinux-32-serial-20010418
c3000                          lifimage_32_serial_20010418  vmlinux-20010115

ls /tftpboot/c3000
bin  boot  cdrom  dev  etc  floppy  home  initrd  lib  mnt  proc  root 
sbin  tmp  usr  var

I used one of the latest tar balls of the parisc-linux site ie I untarred 
nfsroot-20001009.tar.gz
into the c3000 dir.


ON the C3000
boot lan
Interact with IPL
Y

make sure the following is setup
root=/dev/nfs nfsroot=IP_ADDRESS_OF_NFS_SERVER:/tftpboot/c3000

I'm using the above to netboot a C3000 from an i386


Hope this helps.

Cheers
Rick



At 09:08 AM 15/05/2002 +0200, joel.soete@freebel.net wrote:
>Quoting Richard Muratti <rick@ccoz.com>:
>
> > At 07:10 PM 14/05/2002 +0200, joel.soete@freebel.net wrote:
> > >Hey James,
> > >
> > >CUT--
> >
> >
> > >Linux version 2.4.18-pa12-lvm-1.0.3-evms-1.0.0-jfs-1.0.17
> > (root@palinux) (gcc
> > >version 3.0.4) #13 Tue May 14 15:42:21 CEST 2002
> > CUT--
> >
> > NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> > >Looking up port of RPC 100003/2 on 172.16.248.169
> >
> > ^^^^^^^^^^^^^^^^^
> > Are you running nfsd on this machine and have you exported
> > the root file system on it.
> >
> > Cheers
> > Rick
> >
> >
>
>Interesting, in fact before no but now yes:
>palinux:/etc# ps -ef | grep -e rpc -e nfs
>root      9564     1  0 08:26 ?        00:00:00 /sbin/rpc.statd
>root      9627     1  0 08:37 ?        00:00:00 [nfsd]
>root      9628     1  0 08:37 ?        00:00:00 [nfsd]
>root      9629     1  0 08:37 ?        00:00:00 [nfsd]
>root      9630     1  0 08:37 ?        00:00:00 [nfsd]
>root      9631     1  0 08:37 ?        00:00:00 [nfsd]
>root      9632     1  0 08:37 ?        00:00:00 [nfsd]
>root      9633     1  0 08:37 ?        00:00:00 [nfsd]
>root      9634     1  0 08:37 ?        00:00:00 [nfsd]
>root      9637  9635  0 08:37 ?        00:00:00 [rpciod]
>root      9639     1  0 08:37 ?        00:00:00 /usr/sbin/rpc.mountd
>root      9650   258  0 08:41 pts/0    00:00:00 grep -e rpc -e nfs
>palinux:/etc# exportfs
>/               <world>
>palinux:/etc# more /etc/exports
># /etc/exports: the access control list for filesystems which may be exported
>#               to NFS clients.  See exports(5).
>/ *(rw,no_root_squash)
>
>(just for test)
>
>And on HPUX ws:
>
>[wsjso] root /PALINUX # bdf
>Filesystem          kbytes    used   avail %used Mounted on
>...
>palinux:/          1730552 1483088  159552   90% /PALINUX/NFS_TEST
>
>[wsjso] root /PALINUX # ls /PALINUX/NFS_TEST
>.bash_history  GNU-Dev        boot           dev            home
>lost+found     root           tmp            vmlinux
>.memdump       Sources        cdrom          etc            initrd 
>mnt
>           sbin           usr
>Develop        bin            cdrom0         floppy         lib 
>proc
>           tftpboot       var
>Ok.
>
>Never the less it does not help the boot stil failed the same way.
>
>Thanks a lot for advice,
>     Joel
>
>
>-------------------------------------------------
>This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
