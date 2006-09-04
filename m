From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 04 Sep 2006 12:23:56 -0500
Message-ID: <1157390636.3513.21.camel@mulgrave.il.steeleye.com>
References: <200609041657.k84GvPht025978@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200609041657.k84GvPht025978@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2006-09-04 at 12:57 -0400, John David Anglin wrote:
> There needs to be a check to ensure that the code has enough time
> to set cr16 with the new compare time before the counter passes this
> value.  If it misses, the counter will wrap.  This probably doesn't
> need to be a full half tick if it's desireable to avoid negative
> offsets.

Exactly!

> In my mind, it's important to ensure that timer interrupts are not
> disabled for long periods.  If that's not possible, we could go back
> to 100 Hz.  However, I've been using 1000 Hz in an embedded project
> using a small 8-bit micro running at 40 MHz.  So, I think 1000 Hz
> should be possible on most PA processors.

Well ... I'm not sure about the rest of the PA world.  It's certainly
not possible on ioz (or any other pa8800).  According to my benchmarks,
the cache flush IPI takes 47ms to execute.  However, the pa8800 has such
a huge cache, it might not take this long on the other PA boxes.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
