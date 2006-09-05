From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] make parisc interrupts nest properly
Date: Mon, 04 Sep 2006 22:02:12 -0500
Message-ID: <1157425332.3513.35.camel@mulgrave.il.steeleye.com>
References: <1157391143.3513.23.camel@mulgrave.il.steeleye.com>
	<119aab440609041955k6a6b9466h91726bd1a9e2d621@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440609041955k6a6b9466h91726bd1a9e2d621@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2006-09-04 at 22:55 -0400, Carlos O'Donell wrote:
> This patch looks great. What boxes have you tested this with? 32-bit?
> 64-bit?

The only one I currently have access to: a pa8800 (i.e. 64 bit).

There's some testing to do to make sure I haven't disturbed any of the
other bus types, so I'll try it out on my raven when I get that up, but,
unfortunately, the dino block of interrupts, because of the way they're
wired, won't be able to interrupt each other.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
