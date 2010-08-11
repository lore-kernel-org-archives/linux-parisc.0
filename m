From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [rth@redhat.com: Re: [committed] Update config/pa/linux-atomic.c
	and enable sync tests on hppa-linux]
Date: Wed, 11 Aug 2010 15:19:17 -0400
Message-ID: <20100811191917.GA8009@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: deller@gmx.de
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

----- Forwarded message from Richard Henderson <rth@redhat.com> -----

X-Original-To: dave@hiauly1.hia.nrc.ca
Delivered-To: dave@hiauly1.hia.nrc.ca
Date: Wed, 11 Aug 2010 11:03:11 -0700
From: Richard Henderson <rth@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.7)
	Gecko/20100720 Fedora/3.1.1-1.fc13 Thunderbird/3.1.1
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
CC: John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org
Subject: Re: [committed] Update config/pa/linux-atomic.c and enable sync tests
	on hppa-linux
In-Reply-To: <20100811022808.GA25554@hiauly1.hia.nrc.ca>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12

On 08/10/2010 07:28 PM, John David Anglin wrote:
> The attached patches are essentially identical to that recently applied
> to arm.
> 
> Tested on hppa-unknown-linux-gnu with no observed regressions.  Committed
> to trunk.  Plan to backport to 4.4 and 4.5 after testing.

FWIW, I had a browse through this file and it's a bit off.  E.g.:

> __sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
> {
>   int actual_oldval, fail;
>     
>   while (1)
>     {
>       actual_oldval = *ptr;
> 
>       if (oldval != actual_oldval)
>         return actual_oldval;
> 
>       fail = __kernel_cmpxchg (actual_oldval, newval, ptr);
>   
>       if (!fail)
>         return oldval;
>     }
> }

This should not be returning the OLDVAL that the user passed,
it should be returning the lws_ret that the kernel returned.

This is because the user of __sync_val_c_a_s wants avoid the
reload of the value, like so (from libgomp/iter.c):

>       tmp = __sync_val_compare_and_swap (&ws->next, start, nend);
>       if (__builtin_expect (tmp == start, 1))
>         break;
>       start = tmp;

You might be better writing

static int
__kernel_cmpxchg (int oldval, int newval, int *mem)
{
  do {
    asm(...);
  } while (lws_errno == -EAGAIN);

  /* Other possibilities are EFAULT, ENOSYS, EDEADLOCK.  */
  if (__builtin_expect (lws_errno != 0, 0))
    {
      ABORT_INSTRUCTION;
      __builtin_unreachable ();
    }
    
  return lws_ret;
}

and totally hiding the possibility of kernel failure.

This, incidentally, is exactly the implementation of
__sync_val_c_a_s, with arguments in a different order.


r~

----- End forwarded message -----

-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
