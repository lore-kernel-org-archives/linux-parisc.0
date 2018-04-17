From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH v2 2/2] parisc: define stronger ordering for the default
 readX()
Date: Tue, 17 Apr 2018 10:13:28 -0400
Message-ID: <38a1d4e3-cabe-6c39-4355-8d8111637382@codeaurora.org>
References: <1523938133-3224-1-git-send-email-okaya@codeaurora.org>
 <1523938133-3224-2-git-send-email-okaya@codeaurora.org>
 <1523957852.3250.9.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Helge Deller <deller@gmx.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org, arnd@arndb.de, timur@codeaurora.org,
        sulrich@codeaurora.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523957852.3250.9.camel@HansenPartnership.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi James,

> 
> Perhaps if you gave an example of the actual problem you're trying to
> fix we could assess if it affects parisc.

Let me clarify myself here. Maybe, there is a better solution.

		/* assign ownership */
		desc->status = DEVICE_OWN;

		/* notify device of new descriptors */
		writel(DESC_NOTIFY, doorbell);

The difference between writel() and writel_relax() is writel() guarantees
memory transactions to be flushed to the device before the register write.
writel_relaxed() does not provide any guarantees about the memory and IO
operations.

Similarly, readl() provides following code to observe the DMA result while
readl_relaxed() does not provide this guarantee.

Ideally, you want to embed rmb() and wmb() into the writel() and readl()
to provide this guarantee.

PA-RISC doesn't seem to support neither one of the barrier types. If you are
familiar with the architecture, maybe you could guide us here.

Is __raw_writeX() enough to provide this guarantee for this architecture?

Sinan

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
