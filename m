From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] HP9000 C200 Visualize-EG XFree86 Success!
Date: Wed, 5 Jun 2002 10:43:10 +0100 (IST)
Message-ID: <Pine.LNX.4.44.0206051039560.1815-100000__43022.1112714664$1416621360$gmane$org@sal.ucc.ie>
References: <3CFD6578.40301@charter.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: debian-hppa@lists.debian.org, <parisc-linux@parisc-linux.org>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3CFD6578.40301@charter.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, 4 Jun 2002, B. Douglas Hilton wrote:

> Install Notes: "gpm" doesn't seem to work for me, although I
> am running a Dexxa Optical Wheel Mouse through a KVM switch.
> I just set X to "PS/2" and it worked ( but no mouse wheel ).

Try ImPS/2 or ExplorerPS/2 instead and add a line

Option "ZAxisMapping" "4 5"

in the InputDevice Section

> Looks great! I was able to slurp up the whole Debian system
> via the net with no trouble at all. KDE installed with no problems
> and runs pretty well on this crate.
>
> Just ordered a Visualize-24 graphics board on Ebay which I will
> plug in and see if it works better than the EG board.

Sorry to disappoint you, but just the Visualize-EG is supported for now!

gretings max
