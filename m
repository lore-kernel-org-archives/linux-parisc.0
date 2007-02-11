From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] Re: Fw: Another problem with making things static
Date: Sun, 11 Feb 2007 09:56:53 -0600
Message-ID: <1171209413.3406.30.camel__42827.8610147119$1416624284$gmane$org@mulgrave.il.steeleye.com>
References: <20070210130136.9538498b.akpm@linux-foundation.org>
	<20070210214309.GP12958@stusta.de>
	<1171158436.3373.51.camel@mulgrave.il.steeleye.com>
	<20070211073520.GR12958@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: Adrian Bunk <bunk@stusta.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070211073520.GR12958@stusta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-11 at 08:35 +0100, Adrian Bunk wrote:
> On Sat, Feb 10, 2007 at 07:47:16PM -0600, James Bottomley wrote:
> > On Sat, 2007-02-10 at 22:43 +0100, Adrian Bunk wrote:
> > > First of all thanks to Andrew for forwarding this email to me - it's 
> > > otherwise a bit hard to defend against an email that doesn't reach me.
> > 
> > I think if you read the email you'll find it didn't actually attack you
> > at all ... I was careful only to ask for a change of policy before
> > accepting a patch that does nothing but make a function static.
> 
> Then let's call it "trying to establish rule forbidding something 
> established without even informing the people whose actions you want to 
> become forbidden".

I'm sorry, but I didn't realise you would be unable to come up with
justifications for API removal, and thus this would become an
insuperable bar to you.  The justification criterion was meant to be a
more objective way of judging whether some API should be revoked and it
seems to me, as a developer, to be a reasonable and not too onerous one.
As Andrew pointed out, for most of the driver and FS symbols the
justification is simply that this module isn't supposed to be exporting
an API at all.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
