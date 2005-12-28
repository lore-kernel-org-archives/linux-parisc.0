From: Jean-Pierre HOFER <jph@stephenson.dhis.org>
Subject: Re: [parisc-linux] X startup failure / PS/2 mouse failure
Date: Wed, 28 Dec 2005 02:22:09 +0100 (CET)
Message-ID: <200512280122.jBS1MB0N015839@stephenson.net.dhis.org>
References: <200512272338.10264.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512272338.10264.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hi Dave,
> 
> On Tuesday 27 December 2005 15:37, John David Anglin wrote:
> > > On Monday 26 December 2005 22:34, John David Anglin wrote:
> > > > X no longer starts on my c3k using unstable.  The problem seems
> > > > to be:
> > > > 
> > > > (EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
> 
> This message has always been here.

Hello,

I have the same error message on a B180L, although X is starting (gdm).
BUT the 3 buttons PS/2 mouse don't work at all.
I have the following mouse configuration in /etc/X11/XF86Config-4 :

        Section "InputDevice"
		Identifier      "Configured Mouse"
		Driver          "mouse"
		Option          "CorePointer"
		Option          "Device"                "/dev/psaux"
		Option          "Protocol"              "PS/2"
		Option          "Emulate3Buttons"       "false"
	EndSection
										What can be wrong ?
										Is there some other configuration to do for the mouse in any other
config file ?

Thanks in advance for all hints,

Jean-Pierre
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
