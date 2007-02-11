From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] Re: Another problem with making things static
Date: Sat, 10 Feb 2007 19:33:21 -0600
Message-ID: <1171157601.3373.40.camel__27397.8429534056$1416624279$gmane$org@mulgrave.il.steeleye.com>
References: <1171121364.3373.19.camel@mulgrave.il.steeleye.com>
	<20070210130130.2584e4d8.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: Andrew Morton <akpm@linux-foundation.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070210130130.2584e4d8.akpm@linux-foundation.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-02-10 at 13:01 -0800, Andrew Morton wrote:
> On Sat, 10 Feb 2007 09:29:24 -0600 James Bottomley <James.Bottomley@SteelEye.com> wrote:
> 
> > For any person who wants to make a static symbol exported, we force an
> > explanation out of them about what they're trying to do and why.  Might
> > I suggest we apply the same standard to anyone trying to make something
> > static?  i.e. they need to explain clearly why the symbol shouldn't be
> > part of any rational API.
> > 
> 
> The majority of these things are simply oversights: people forgot to
> type `static'.
> 
> C got the defualt wrong..

I agree ... lots of symbols in drivers or filesystems are obviously not
part of APIs ... however, that's not necessarily true of the kernel
proper.  I think forcing someone to think about what they're doing and
justify going from non static to static or vice versa is a good idea in
those cases.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
