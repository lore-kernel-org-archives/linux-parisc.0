From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] X startup failure / PS/2 mouse failure
Date: Wed, 28 Dec 2005 22:19:11 +0100
Message-ID: <200512282219.11997.deller@gmx.de>
References: <200512280122.jBS1MB0N015839@stephenson.net.dhis.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Jean-Pierre HOFER <jph@stephenson.dhis.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512280122.jBS1MB0N015839@stephenson.net.dhis.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 28 December 2005 02:22, Jean-Pierre HOFER wrote:
> Hello,
> 
> I have the same error message on a B180L, although X is starting (gdm).
> BUT the 3 buttons PS/2 mouse don't work at all
> I have the following mouse configuration in /etc/X11/XF86Config-4 :
> 
>         Section "InputDevice"
> 		Identifier      "Configured Mouse"
> 		Driver          "mouse"
> 		Option          "CorePointer"
> 		Option          "Device"                "/dev/psaux"
> 		Option          "Protocol"              "PS/2"

Try 
Device=/dev/input/mice
Protocol=imps2
and read the parisc-FAQ at http://www.parisc-linux.org/faq/index.html 

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
