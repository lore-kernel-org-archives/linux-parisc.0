Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA25808
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 22:50:18 -0700
Date: Mon, 15 Jan 2001 21:53:58 -0800
From: Richard Henderson <rth@redhat.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Jeffrey A Law <law@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
Message-ID: <20010115215358.B27073@redhat.com>
References: <Pine.LNX.4.21.0101160955240.4272-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0101161215520.4272-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101161215520.4272-100000@front.linuxcare.com.au>; from Alan Modra on Tue, Jan 16, 2001 at 12:20:19PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 16, 2001 at 12:20:19PM +1100, Alan Modra wrote:
> 	* config/pa/pa.c (pa_init_machine_status, pa_free_machine_status,
> 	pa_init_expanders): New functions.

You need a mark_machine_status function.  It is also much better
to set the global variables once in override_options than for
every function in init_expanders.


r~
