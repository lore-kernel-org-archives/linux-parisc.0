Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE852483E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Jul 2002 16:56:40 -0600 (MDT)
Received: from haydn (pcp357875pcs.elictc01.md.comcast.net [68.55.155.46])
 by mtaout06.icomcast.net
 (iPlanet Messaging Server 5.1 HotFix 0.8 (built May 13 2002))
 with SMTP id <0GZK004D6KZJQI@mtaout06.icomcast.net> for
 parisc-linux@lists.parisc-linux.org; Sat, 20 Jul 2002 18:54:55 -0400 (EDT)
Date: Sat, 20 Jul 2002 18:51:39 -0400
From: Frank Alden Smith <falden@comcast.net>
To: parisc-linux@lists.parisc-linux.org
Message-id: <NGBBJKHCMLEJELIEEHNOAEFKCAAA.falden@comcast.net>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] bug-buddy failure
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

I just installed this version of bug-buddy:

puccini:~# dpkg -l bug-buddy
Desired=Unknown/Install/Remove/Purge/Hold
|
Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err:
uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-======================================
======
ii  bug-buddy      2.1.6-1        A graphical bug reporting tool for
GNOME
puccini:~#

Unfortunately, bug-buddy fails. Here, is what ~/.gnome-errors says
happens:

Gtk-WARNING **: gtk_signal_disconnect_by_data(): could not find handler
containi
ng data (0x170890)
The program 'bug-buddy' received an X Window System error.
This probably reflects a bug in the program.
The error was '187'.
  (Details: serial 914 error_code 187 request_code 154 minor_code 8)
  (Note to programmers: normally, X errors are reported asynchronously;
   that is, you will receive the error a while after causing it.
   To debug your program, run it with the --sync command line
   option to change this behavior. You can then get a meaningful
   backtrace from your debugger if you break on the gdk_x_error()
function.)

Any suggestions as to how to fix it?

Take care,

Frank Alden Smith
