From: Srinivasa DS <srinivasa@in.ibm.com>
Subject: Re: [RFC][PATCH] Demultiplexing SIGTRAP signal -v2
Date: Mon, 29 Sep 2008 19:04:15 +0530
Message-ID: <48E0D957.5080907@in.ibm.com>
References: <200809221602.32616.srinivasa@in.ibm.com> <20080923112812.GL29021@elte.hu> <20080923113001.GA12531@elte.hu> <200809231955.01564.srinivasa@in.ibm.com> <20080923143120.GD14041@elte.hu> <20080926090637.9C0851541FA@magilla.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, paulus@samba.org,
	linuxppc-dev@ozlabs.org, linux-parisc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>
To: Roland McGrath <roland@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080926090637.9C0851541FA@magilla.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Roland McGrath wrote:
> I certainly have no objection in principle.  I doubt that any x86 userland
> apps expect certain si_code values for SIGTRAP now, since the existing
> values are not of any real use.  (Signal handlers get the thread.trap_no and
> thread.error_code values from hardware to guess from, and debuggers via
> ptrace get the hardware %db6 value to guess from.)  I do have a few comments.
> 
> If you're doing it, I think you should do the do_int3 case too,
> so every machine-generated SIGTRAP has a meaningful si_code value.

Roland
    Thanks for your comments.

>   I'm inclined to consolidate the si_code logic there, and just
> pass it the hardware bits or let it get them from the thread_struct
> (trap_nr, error_code, debugreg6).

That sounds like a good idea. Let me go through code and get back to you.

Thanks
  Srinivasa DS

