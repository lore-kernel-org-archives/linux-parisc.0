Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA12112
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 18:48:03 -0700
Date: Sat, 2 Dec 2000 17:50:07 -0800
From: Richard Henderson <rth@redhat.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-patches@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001202175007.A28085@redhat.com>
References: <20001202114327.C27671@redhat.com> <200012022301.SAA04377@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012022301.SAA04377@hiauly1.hia.nrc.ca>; from John David Anglin on Sat, Dec 02, 2000 at 06:01:27PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 02, 2000 at 06:01:27PM -0500, John David Anglin wrote:
> I saw this but for some reason it didn't stop the set after the call
> from being deleted in the combine pass.

Oh, right.

In any case, the patch is applied in the wrong place.  It
needs to happen in calculate_global_regs_live, near

      /* Force the stack pointer to be live -- which might not already be
         the case for blocks within infinite loops.  */
      SET_REGNO_REG_SET (new_live_at_end, STACK_POINTER_REGNUM);



r~
