Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sngrel5.hp.com (sngrel5.hp.com [192.6.86.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 510C9483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Sep 2003 11:13:07 -0600 (MDT)
Received: from XIN02.india.hp.com (xin02.india.hp.com [15.10.41.164])
	by sngrel5.hp.com (Postfix) with ESMTP id D8376166
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Sep 2003 01:13:02 +0800 (SGP)
Message-ID: <A11077E28200D51182EA00D0B775525309AA614D@xin02.india.hp.com>
From: "SUDARSANAN,RANJITH (HP-India,ex2)" <ranjith_sudarsanan@hp.com>
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 22 Sep 2003 22:43:00 +0530
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3812C.C6304B46"
Subject: [parisc-linux] Problem with SCSI_IOCTL_GET_PCI ioctl
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C3812C.C6304B46
Content-Type: text/plain

Hi All,

I found a problem with ioctl SCSI_IOCTL_GET_PCI. This ioctl returns the slot
name. I got the following error upon using this ioctl. The program can
reproduce this error. This problems is not there on IA64 kernels.

		sys32_ioctl: Unknown cmd fd(3) cmd(00005387) arg(faf00370)

I found this problem in the kernel version 2.4.20-pa18 and was able to
reproduce the problem on 2.4.22-pa3. I am not sure if this problem is fixed
yet in 2.6.X 

This error can be reproduced using the following program.

/*BEGIN PROGRAM*/

#include <stdio.h>
#include <fcntl.h>
main ()
{
        int tst;

        struct file *fd;
typedef struct sg_scsi_id { 
    int host_no;        
    int channel;
    int scsi_id;        
    int lun;
    int scsi_type;     
    short h_cmd_per_lun;
    short d_queue_depth;
    int unused[2];      
} sg_scsi_id_t; 

struct sg_scsi_id sg_info;

char slot_name[16];

fd=open("/dev/sg0",O_RDWR);
printf("fd=%d\n",fd);
        tst=ioctl(fd, 0x2276, &sg_info);
        printf("return from GET_SCSI_ID=%d\n",tst);
        tst=ioctl(fd, 0x5387, slot_name);
        printf("return from SCSI_IOCTL_GET_PCI=%d, %s\n",tst,slot_name);
}

/* END PROGRAM */

Kernel:
oak:/home/sranjith# uname -a
Linux oak 2.4.22-pa3 #1 Thu Sep 18 23:19:58 IST 2003 parisc64 unknown

Output after running the program:
oak:/home/sranjith# ./a.out
fd=3
return from GET_SCSI_ID=0
sys32_ioctl: Unknown cmd fd(3) cmd(00005387) arg(faf00370)
return from SCSI_IOCTL_GET_PCI=-1, 

I traced this error down to ioctl32.c line no. ~ 3056 to 3063

/* Big S */
COMPATIBLE_IOCTL(SCSI_IOCTL_GET_IDLUN)
COMPATIBLE_IOCTL(SCSI_IOCTL_DOORLOCK)
COMPATIBLE_IOCTL(SCSI_IOCTL_DOORUNLOCK)
COMPATIBLE_IOCTL(SCSI_IOCTL_TEST_UNIT_READY)
COMPATIBLE_IOCTL(SCSI_IOCTL_TAGGED_ENABLE)
COMPATIBLE_IOCTL(SCSI_IOCTL_TAGGED_DISABLE)
COMPATIBLE_IOCTL(SCSI_IOCTL_GET_BUS_NUMBER)
COMPATIBLE_IOCTL(SCSI_IOCTL_SEND_COMMAND)
COMPATIBLE_IOCTL(SCSI_IOCTL_GET_PCI) 		/*This entry is missing in
the ioctl translation table*/
/* Big V */
COMPATIBLE_IOCTL(VT_SETMODE)
COMPATIBLE_IOCTL(VT_GETMODE)
COMPATIBLE_IOCTL(VT_GETSTATE)
COMPATIBLE_IOCTL(VT_OPENQRY)

The above entry fixed the problem. I am surprised that ioctls code wasn't
tested. When I see the code. This seems to be the last ioctl which was
added.

I am not sure if I should post this here, please let me know if I am wrong.


with warm regards,
Ranjith Sudarsanan

--------------------------------------
Ranjith Sudarsanan
Rage Team
30CA, Cunningham Road
Bangalore
Off: 91-80-205 3190
Res: 91-80-522 2577 
web: http://nt2651.india.hp.com:8080/ <http://nt2651.india.hp.com:8080/> 
--------------------------------------
"When the head bows, it meets the heart and that head which has met the
heart gets the crown!!! - Sri Sri"


------_=_NextPart_001_01C3812C.C6304B46
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2655.35">
<TITLE>Problem with SCSI_IOCTL_GET_PCI ioctl</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi All,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I found a problem with ioctl =
SCSI_IOCTL_GET_PCI. This ioctl returns the slot name. I got the =
following error upon using this ioctl. The program can reproduce this =
error. This problems is not there on IA64 kernels.</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><I> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</I></B><I></I> <FONT =
COLOR=3D"#FF0000" SIZE=3D2 FACE=3D"Arial">sys32_ioctl: Unknown cmd =
fd(3) cmd(00005387) arg(faf00370)</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I found this problem in the kernel =
version 2.4.20-pa18 and was able to reproduce the problem on =
2.4.22-pa3. I am not sure if this problem is fixed yet in 2.6.X =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">This error can be reproduced using the =
following program.</FONT>
</P>

<P><B><FONT SIZE=3D2 FACE=3D"Arial">/*BEGIN PROGRAM*/</FONT></B>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">#include &lt;stdio.h&gt;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">#include &lt;fcntl.h&gt;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">main ()</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">{</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int =
tst;</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct file =
*fd;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">typedef struct sg_scsi_id { </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; int =
host_no;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; int =
channel;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; int =
scsi_id;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; int lun;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; int =
scsi_type;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; short =
h_cmd_per_lun;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; short =
d_queue_depth;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; int =
unused[2];&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">} sg_scsi_id_t; </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">struct sg_scsi_id sg_info;</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">char slot_name[16];</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">fd=3Dopen(&quot;/dev/sg0&quot;,O_RDWR);</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">printf(&quot;fd=3D%d\n&quot;,fd);</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
tst=3Dioctl(fd, 0x2276, &amp;sg_info);</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
printf(&quot;return from GET_SCSI_ID=3D%d\n&quot;,tst);</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
tst=3Dioctl(fd, 0x5387, slot_name);</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
printf(&quot;return from SCSI_IOCTL_GET_PCI=3D%d, =
%s\n&quot;,tst,slot_name);</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">}</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">/*</FONT><B><FONT SIZE=3D2 =
FACE=3D"Arial"> END PROGRAM</FONT></B> <FONT SIZE=3D2 =
FACE=3D"Arial">*/</FONT>
</P>

<P><B><FONT SIZE=3D2 FACE=3D"Arial">Kernel:</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith# uname -a</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Linux oak 2.4.22-pa3 #1 Thu Sep 18 =
23:19:58 IST 2003 parisc64 unknown</FONT>
</P>

<P><B><FONT SIZE=3D2 FACE=3D"Arial">Output after running the =
program:</FONT></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">oak:/home/sranjith# ./a.out</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">fd=3D3</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">return from GET_SCSI_ID=3D0</FONT>
<BR><FONT COLOR=3D"#FF0000" SIZE=3D2 FACE=3D"Arial">sys32_ioctl: =
Unknown cmd fd(3) cmd(00005387) arg(faf00370)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">return from SCSI_IOCTL_GET_PCI=3D-1, =
</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I traced this error down to</FONT><B> =
<FONT COLOR=3D"#FF00FF" SIZE=3D2 =
FACE=3D"Arial">ioctl32.c</FONT></B><FONT SIZE=3D2 FACE=3D"Arial"> line =
no. ~ 3056 to 3063</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">/* Big S */</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_GET_IDLUN)</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_DOORLOCK)</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_DOORUNLOCK)</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_TEST_UNIT_READY)</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_TAGGED_ENABLE)</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_TAGGED_DISABLE)</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_GET_BUS_NUMBER)</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_SEND_COMMAND)</FONT>
<BR><B><I><FONT COLOR=3D"#FF00FF" SIZE=3D2 =
FACE=3D"Arial">COMPATIBLE_IOCTL(SCSI_IOCTL_GET_PCI) &nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*This entry is missing in =
the ioctl translation table*/</FONT></I></B>
<BR><FONT SIZE=3D2 FACE=3D"Arial">/* Big V */</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">COMPATIBLE_IOCTL(VT_SETMODE)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">COMPATIBLE_IOCTL(VT_GETMODE)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">COMPATIBLE_IOCTL(VT_GETSTATE)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">COMPATIBLE_IOCTL(VT_OPENQRY)</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">The above entry fixed the problem. I =
am surprised that ioctls code wasn't tested. When I see the code. This =
seems to be the last ioctl which was added.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I am not sure if I should post this =
here, please let me know if I am wrong.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">with warm regards,</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Ranjith Sudarsanan</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">--------------------------------------</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Ranjith Sudarsanan</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Rage</FONT><FONT SIZE=3D2 =
FACE=3D"Arial"> Team</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">30CA, Cunningham Road</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Bangalore</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Off: 91-80-205</FONT> <FONT SIZE=3D2 =
FACE=3D"Arial">3190</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Res: 91-80-522 2577 </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">web: </FONT><A =
HREF=3D"http://nt2651.india.hp.com:8080/"><U><FONT COLOR=3D"#0000FF" =
SIZE=3D2 FACE=3D"Arial">http://nt2651.india.hp.com:8080/</FONT></U></A>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">--------------------------------------</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&quot;</FONT><FONT SIZE=3D2 =
FACE=3D"Arial">When the head bows, it meets the heart and that =
head</FONT> <FONT SIZE=3D2 FACE=3D"Arial">w</FONT><FONT SIZE=3D2 =
FACE=3D"Arial">hich has</FONT><FONT SIZE=3D2 FACE=3D"Arial"></FONT> =
<FONT SIZE=3D2 FACE=3D"Arial">met</FONT><FONT SIZE=3D2 =
FACE=3D"Arial"></FONT> <FONT SIZE=3D2 FACE=3D"Arial">the heart gets the =
crown!!!</FONT><FONT SIZE=3D2 FACE=3D"Arial"> - Sri Sri&quot;</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C3812C.C6304B46--
