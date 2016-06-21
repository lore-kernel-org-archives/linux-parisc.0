From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] devpts: remove DEVPTS_MULTIPLE_INSTANCES from all
 configs
Date: Tue, 21 Jun 2016 05:30:40 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750106944A83@us01wembx1.internal.synopsys.com>
References: <20160620091258.11233-1-00moses.alexander00@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-snps-arc@lists.infradead.org"
        <linux-snps-arc@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "bamvor.zhangjian@linaro.org" <bamvor.zhangjian@linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
To: Alexandru Moise <00moses.alexander00@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Return-path: <linux-mips-bounce@linux-mips.org>
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-Id: linux-mips <linux-mips.eddie.linux-mips.org>
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>

On Monday 20 June 2016 02:44 PM, Alexandru Moise wrote:
> As each mount of devpts is now an independent filesystem,
> the DEVPTS_MULTIPLE_INSTANCES config option no longer exists.
> So remove it.
>
> Signed-off-by: Alexandru Moise <00moses.alexander00@gmail.com>

For arch/arc

Acked-by: Vineet Gupta <vgupta@synopsys.com>
