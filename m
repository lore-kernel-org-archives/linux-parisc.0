From: Helge Deller <deller@gmx.de>
Subject: Re: No keyboard repeat (was: [parisc-linux] No "#/'" and "<>|" keys
	with german HIL-keyboard)
Date: Mon, 1 Nov 2004 18:58:18 +0100
Message-ID: <200411011858.18394.deller@gmx.de>
References: <200410311421.17271.j.raspe@t-online.de>
	<200410311920.33777.deller@gmx.de>
	<200410312125.22181.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: Johannes Raspe <j.raspe@t-online.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410312125.22181.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 31 October 2004 21:25, Johannes Raspe wrote:
> Just one other little problem: the keypresses are not repeated (console and X). 
> I  tried "kbdrate" but this does nothing.
> Is this a kernel related or a configuration problem?

it was a kernel problem - it's fixed now in CVS HEAD (2.6.10-rc1-pa8).

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
