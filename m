Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.mts.net (smtp1.mts.net [205.200.16.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4262C4841
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Nov 2003 21:14:02 -0700 (MST)
Reply-To: <sgbrodie@mts.net>
From: "Shane G. Brodie" <sgbrodie@mts.net>
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Dual NICs on 9000/715, anyone?
Date: Sat, 15 Nov 2003 22:16:11 -0600
Message-ID: <LPENLKGPOOFMNIPKLBNDAEFECAAA.sgbrodie@mts.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-reply-to: <20031116015159.GA4059@colo.lackof.org>
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

Slightly off topic:  I've been fighting with a 715/80 with an EISA 10/100 VG
AnyLan card in it for the last 2 weeks.  I can not get the network to come
up. I have a whole series of issues to resolve unrelated to the network
hardware, but that's another long story ... (the old SCSI CD-ROM doesn't
like CD-RW ... don't have spare CD-R ... disc 2 of my downloaded set is
unreadable - how I wish the MD5 checksums were up-to-date ...  I could set
up dial-up (eeek!) but ...

I don't have have an EtherTwist transceiver for the built-in (and don't know
if it'll work anyway) - can anyone advise me whether or not the the built-in
10-Base-2 Ethernet NIC will work using a AUI-10MB Ethernet transceiver
connected to a Linksys DSL 10/100 router?  (I have a CenterCOM MX10 IEEE
802.3 MicroTransceiver 10-Base-2 - a lot of good that'll do me ...).

Regards

Shane Brodie

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Grant
Grundler
Sent: November 15, 2003 7:52 PM
To: buggz
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dual NICs on 9000/715, anyone?


On Sat, Nov 15, 2003 at 06:22:32PM -0500, buggz wrote:
> Anyone get dual NICs working on this machine?
> The second one is on the EISA expansion card.

EISA DMA isn't working, IIRC.
I don't recall if anyone has published Wax (EISA) DMA docs.
If not, that means someone from HP would have to write it
or get enough detail from someone inside HP to write it.

> It works in HPUX.
> I'd like to get this to work in linux and use the box as a router/gw.

At one we had a NIC working using PIO (not DMA).
But don't expect stellar performance.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
