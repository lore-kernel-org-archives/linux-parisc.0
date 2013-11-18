From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] aio: fix D-cache aliasing issues
Date: Sun, 17 Nov 2013 20:03:13 -0500
Message-ID: <BLU0-SMTP844E685A4399DA3621BB1097E40@phx.gbl>
References: <20131115220529.GA3160@ls3530.box> <1384555325.2003.39.camel@dabdike.int.hansenpartnership.com> <20131116200717.GA18939@schnuecks.de> <20131116200959.GA14098@kvack.org> <528933BC.50806@gmx.de> <1384724973.2050.14.camel@dabdike.int.hansenpartnership.com> <20131117234707.GA25545@p100.box>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
	Simon Baatz <gmbnomis@gmail.com>, linux-aio@kvack.org,
	linux-kernel@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131117234707.GA25545@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17-Nov-13, at 6:47 PM, Helge Deller wrote:

> I only changed kunmap_parisc() to always call
> flush_kernel_dcache_page_addr(addr) - independend if we are on a  
> PA8800/8900
> CPU or not - which is what you proposed in your original mail.

In which case the flushes in clear_user_page() and copy_user_page()  
aren't needed.

Dave
--
John David Anglin	dave.anglin@bell.net



