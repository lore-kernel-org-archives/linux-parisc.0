From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: Patch for segfaults in minifail tests
Date: Sat, 1 May 2010 20:29:09 +0200
Message-ID: <o2n7d01f9f01005011129ye53a95acq164ca882aa8792ef@mail.gmail.com>
References: <1272651697.2844.39.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1272651697.2844.39.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 30, 2010 at 8:21 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> T-bone is keeping a web page with all the failing tests on now:
>
> http://wiki.parisc-linux.org/TestCases

About this: I've had to blaze through hundreds of emails to get this
data together. TBH it's been quite hard to figure which testcase
related to which bug and which patch. I'm not absolutely sure that my
segmentation is right (all the futex/fork/vfork/etc threads seem to
deal with the same kind of problems). I'm also not entirely certain
that I haven't listed bugs that are now fixed. I may also have
overlooked mails containing non-obvious testcases.

What I'm trying to say is that this page is useless without your
feedback. I'd especially need people to, short of updating it
themselves (^-^), tell me what can be added/removed/improved. Given a
Message-ID, I can do the dirty work ;-)

Comments are welcome, I hope this will be anyhow helpful.

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
