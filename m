Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47E07483C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 02:25:18 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Holst, Richard G (Dick), PROSH" <dholst@att.com>,
	"parisc users" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] X windows on my D350 Server
Date: Mon, 18 Feb 2002 10:25:15 +0100
References: <28F05913385EAC43AF019413F674A017013F87D4@OCCLUST04EVS1.ugd.att.com>
In-Reply-To: <28F05913385EAC43AF019413F674A017013F87D4@OCCLUST04EVS1.ugd.att.com>
MIME-Version: 1.0
Message-Id: <E16ck2t-0000Fa-00@linuxlab.wdf.sap-ag.de>
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

Hi Dick,

Some ideas:
- Do you really have a PS/2 mouse connected ? If not X will not start.
- Does /dev/mouse really points to /dev/psaux (or something like that) ?

Regards,
Helge

On Friday 15 February 2002 21:25, Holst, Richard G (Dick), PROSH wrote:
> Folks,
>
> When my D server boots and tries to run X, I get an initial gray background
> and the X cursor, followed by a white box in the center of the screen, the
> X cursor turns to an arrow and then the screen goes blank. The login prompt
> then appears on my serial terminal.  The syslog file seems to be indicating
> that the system is having a problem with the PS/2 transmit buffer timeout.
> My /etc/X11/XF86Config-4 file is set up as follows for the mouse:
>
> __________________________________________
> __________________________________________
>
> Section "InputDevices"
>
> # Identifier and driver
>
> 	Identifier	"mouse1"
> 	Driver		"mouse"
> 	Option	"Protocol"	"PS/2"
> 	Option	"Device"	"/dev/mouse"
>
> EndSection
>
> _________________________________________
> _________________________________________
>
> Can anyone help me with this problem please?
>
> Dick Holst
