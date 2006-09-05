From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] [PATCH] make parisc interrupts nest properly
Date: Tue, 05 Sep 2006 19:14:33 +0000
Message-ID: <44FDCC99.2040805@scarlet.be>
References: <1157391143.3513.23.camel@mulgrave.il.steeleye.com>	<119aab440609041955k6a6b9466h91726bd1a9e2d621@mail.gmail.com>
	<1157425332.3513.35.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1157425332.3513.35.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



James Bottomley wrote:
> On Mon, 2006-09-04 at 22:55 -0400, Carlos O'Donell wrote:
> 
>>This patch looks great. What boxes have you tested this with? 32-bit?
>>64-bit?
> 
> 
> The only one I currently have access to: a pa8800 (i.e. 64 bit).
> 
duno if that could help: I tested it on b2k 32bit kernel and c110.
I did noticed build pb nor boot ;-)

Just compare on b2k the time to build the same kernel tree (same config):
without patch:

real    30m43.031s
user    26m17.318s
sys     3m58.584s

with patch:

real    31m14.598s
user    26m9.790s
sys     4m40.426s

imho no significant differences.

Joel

> There's some testing to do to make sure I haven't disturbed any of the
> other bus types, so I'll try it out on my raven when I get that up, but,
> unfortunately, the dino block of interrupts, because of the way they're
> wired, won't be able to interrupt each other.
> 
> James
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
