From: =?ISO-8859-15?Q?Corn=E9_Beerse?= <cbeerse@lycos.nl>
Subject: [parisc-linux] Linux 2.6, 712-workstation and (no) keyboard
Date: Tue, 07 Dec 2004 13:51:30 +0100
Message-ID: <41B5A752.4090906@lycos.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: maillist parisc-linux <parisc-linux@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

Recently I found time to update my 712 workstation to kernel version 2.6.x. Most 
recent kernels I tried from http://cvs.parisc-linux.org/download/linux-2.6/ or 
build from source, don't give me a keyboard at the console.

Is this something I have to define, like re-create device files with mkdev?

Is something changed? I recall messages on using special pa-ps2 code v.s. 
default linux ps2 code. Should a new 712-config file suit my needs? Which 
options to try/test/use?

Or is it still work in progress? Then: what's the status and can I contribute?

At build-time and/or boot-time I donnot see any alarming messages like failing 
builds or links or such.



CBee

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
