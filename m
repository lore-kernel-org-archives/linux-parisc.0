Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-5-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF9AF482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 May 2002 01:28:51 -0600 (MDT)
Date: Fri, 31 May 2002 08:28:49 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020531072849.GD1145@tykepenguin.com>
References: <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020530133515.B15631@systemhalted>
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

On Thu, May 30, 2002 at 01:35:15PM -0400, Carlos O'Donell Jr. wrote:
> > Hmmm
> > CONFIG_KDB=y      : no serial console or FW SCSI
> > CONFIG_KDB=n      : all works fine.
> > bizarre!
> > patrick
> >
> 
> Did you try building+booting from the kdb patches?

Yes, exactly the same results. There's some thing different about the
binary vmlinux thatmay, or may not, be relevant. The kdb one seems to
have fewer segments than a non-kdb one:

(Normal boot:)
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1937528 mediaptr 0x1000
Segment 1 load 002da000 size 295576 mediaptr 0x1db000
Segment 2 load 00324000 size 247332 mediaptr 0x224000
Segment 3 load 00364000 size 8192 mediaptr 0x261000
Segment 4 load 00368000 size 32768 mediaptr 0x263000
Segment 5 load 00391084 size 97664 mediaptr 0x26b084
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

(total segment size: 2619060)


KDB boot:
ELF32 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 2035156 mediaptr 0x1000
Segment 1 load 002f2000 size 692152 mediaptr 0x1f2000
Segment 2 load 0039c000 size 253952 mediaptr 0x29b000
Segment 3 load 003e0000 size 32768 mediaptr 0x2d9000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

(total segment size: 3014028)


Patrick
