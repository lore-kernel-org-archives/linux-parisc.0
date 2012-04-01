From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] PARISC: Avoid undefined shift in cnv_float.h
Date: Sun, 1 Apr 2012 13:25:17 -0400
Message-ID: <BLU0-SMTP946BD083EC5DC957E1A8F6974F0@phx.gbl>
References: <BLU0-SMTP6824DB7507844D291735CC974F0@phx.gbl> <1333299990.9720.0.camel@dabdike>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1333299990.9720.0.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1-Apr-12, at 1:06 PM, James Bottomley wrote:

> On Sun, 2012-04-01 at 12:57 -0400, John David Anglin wrote:
>> The attached change fixes a float conversion problem found running  
>> the
>> GCC testsuite with GCC configured with --with-arch=2.0.
>
> Could you describe the actual problem? (it helps enormously when  
> people
> look at the change logs a year later and try and work out what the
> actual issue is).


The actual problem occurs for an exponent value of 63.  This is the  
maximum
exponent value that can be passed.  This causes a left shift by 32 in  
the else
hunk of the macro.  This causes undefined behavior and the wrong value  
is
returned for dresultB.  The fix is the check "exponent <= 62".  If the  
exponent
is 63, dresultB is set to 0.

The patch also optimizes the operation a bit by copying
"Sall(sgl_value) << SGL_EXP_LENGTH" to val, so that sgl_value is not  
modified.

Dave
--
John David Anglin	dave.anglin@bell.net



