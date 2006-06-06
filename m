From: "Thibaut VARENE" <varenet@gmail.com>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Tue, 6 Jun 2006 14:51:47 +0200
Message-ID: <7d01f9f00606060551n2aabd3e9p908745991df33a2f@mail.gmail.com>
References: <200606052020.52908.kmh@sonic.net>
	<200606060349.k563n4ST023145@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606060349.k563n4ST023145@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/6/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > Looking over your earlier reply, you indicated that the module must be=20
> > quite "large" - do you mean file size of the .ko file?
> > Because that is way under the 8MB you mentioned - the file is around 200kB =
> > in=20
> > size...
>
> I wonder if that implies a bug a bug in the kernel loader.  I could
> see a problem with PCREL17F relocations with files around 200kB.
> These are used with the PA 1.x "bl" instruction.  The range for
> "bl" instructions is about +/- 262kB.  The range for the 22F "b,l"
> instruction is 32 times larger.

A number of kernel modules fail to load nowadays on parisc. That
includes xfs, netfilter, ipv6... Some are known bloated big ones, but
others are quite surprising. In any case that's clearly a problem we
want to fix at some point.

I remember Randolph saying that might indeed be a kernel loader
issue... Randolph, any thought?

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
