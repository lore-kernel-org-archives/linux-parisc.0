From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Sun, 23 Jul 2006 21:32:23 -0600
Message-ID: <20060724033223.GE29603@parisc-linux.org>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 23, 2006 at 10:54:38PM -0400, Thibaut VARENE wrote:
> My take is that we see that bug so much more on pa8800 because of its
> huge cache and thus because we hit cache much more often than on all
> other machines...

I don't think so.  pa8800 has less cache per core than pa8700.  The L2
cache is ignorable for the purposes of this scenario, since it's
transparent to software.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
