From: Andrew Morton <akpm@linux-foundation.org>
Subject: [parisc-linux] Re: Another problem with making things static
Date: Sat, 10 Feb 2007 13:01:30 -0800
Message-ID: <20070210130130.2584e4d8.akpm__8441.63138322092$1416624281$gmane$org@linux-foundation.org>
References: <1171121364.3373.19.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1171121364.3373.19.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 10 Feb 2007 09:29:24 -0600 James Bottomley <James.Bottomley@SteelEye.com> wrote:

> For any person who wants to make a static symbol exported, we force an
> explanation out of them about what they're trying to do and why.  Might
> I suggest we apply the same standard to anyone trying to make something
> static?  i.e. they need to explain clearly why the symbol shouldn't be
> part of any rational API.
> 

The majority of these things are simply oversights: people forgot to
type `static'.

C got the defualt wrong..
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
