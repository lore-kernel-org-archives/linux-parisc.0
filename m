From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Tue, 09 Jul 2013 11:18:52 -0400
Message-ID: <51DC29DC.8060106@bell.net>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <loom.20130709T072537-28@post.gmane.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/9/2013 1:34 AM, Alex Ivanov wrote:
> I'm using a c8000 with firegl x3. I approve that console works,
> although in an unaccelerated mode. However xorg isn't:
> http://pastebin.com/Y1h2BVHB
> The system is latest unstable. The xorg is of 1:7.7+3 version.
Suggest you hack arch/parisc/kernel/cache.c to disable this
optimization:

         /* Flushing the whole cache on each cpu takes forever on
            rp3440, etc.  So, avoid it if the mm isn't too big.  */
         if (mm_total_size(mm) < parisc_cache_flush_threshold) {

It is probably the get_ptep call in the non current case that's failing
with firegl x3.  It would be useful if you could test if the current case
, "mm->context == mfsp(3)" case works.  You would have to move return
and disable non current block.

Dave

-- 
John David Anglin    dave.anglin@bell.net

