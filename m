Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9205E482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Aug 2003 11:00:25 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19idGR-0005Px-0J; Fri, 01 Aug 2003 18:00:23 +0100
Date: Fri, 1 Aug 2003 18:00:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: LaMont Jones <lamont@smallone.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, lamont@hp.com
Subject: Re: [parisc-linux] __arch__swab24()
Message-ID: <20030801170022.GX22222@parcelfarce.linux.theplanet.co.uk>
References: <20030801162255.GA28998@smallone.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030801162255.GA28998@smallone.fc.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Aug 01, 2003 at 10:22:55AM -0600, LaMont Jones wrote:
> Any comments before I commit it to 2.4 and 2.5?

Here's what I came up with based on your patch.  It's embedded in a
test program.

#include <stdio.h>

typedef int __u32;

static int vanilla_swab24(int i)
{
        return ((i & 0xff) << 16) | (i & 0xff00) | ((i & 0xff0000) >> 16);
}

static __inline__ __const__ __u32 ___arch__swab24(__u32 x)
{
        __asm__("shd %0, %0, 8, %0\n\t"         /* shift xabcxabc -> cxab */
                "dep %0, 15, 8, %0\n\t"         /* deposit cxab -> cbab */
                "shd %%r0, %0, 8, %0"           /* shift 0000cbab -> 0cba */
                : "=r" (x)
                : "0" (x));
        return x;
}

int main(void)
{
        int i; 
        for (i = 0; i < 0x1ffffff; i++) { 
                if (___arch__swab24(i) != vanilla_swab24(i))
                        printf("Problem with i = %d\n", i);
        }
        return 0;
}


-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
