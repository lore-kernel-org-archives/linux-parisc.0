Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from almso2.proxy.att.com (almso2.att.com [192.128.166.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE4EB4859
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 13:26:07 -0700 (MST)
Received: from attrh1i.attrh.att.com ([135.71.62.10])
	by almso2.proxy.att.com (AT&T IPNS/MSO-3.0) with ESMTP id g1FKQ5921889
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 15:26:05 -0500 (EST)
Received: from occlust04evs1.ugd.att.com (135.71.164.12) by attrh1i.attrh.att.com (5.5.029)
        id 3C62A10C00078890 for parisc-linux@lists.parisc-linux.org; Fri, 15 Feb 2002 15:26:00 -0500
Date: Fri, 15 Feb 2002 15:25:56 -0500
Message-ID: <28F05913385EAC43AF019413F674A017013F87D4@OCCLUST04EVS1.ugd.att.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
From: "Holst, Richard G (Dick), PROSH" <dholst@att.com>
To: "parisc users" <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] X windows on my D350 Server
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

Folks,

When my D server boots and tries to run X, I get an initial gray =
background and the X cursor, followed by a white box in the center of =
the screen, the X cursor turns to an arrow and then the screen goes =
blank. The login prompt then appears on my serial terminal.  The syslog =
file seems to be indicating that the system is having a problem with the =
PS/2 transmit buffer timeout. My /etc/X11/XF86Config-4 file is set up as =
follows for the mouse:

__________________________________________
__________________________________________

Section "InputDevices"

# Identifier and driver

	Identifier	"mouse1"
	Driver		"mouse"
	Option	"Protocol"	"PS/2"
	Option	"Device"	"/dev/mouse"

EndSection

_________________________________________
_________________________________________

Can anyone help me with this problem please?

Dick Holst
