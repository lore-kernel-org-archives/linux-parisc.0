From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: [RFC][PATCH v2 0/7] printk/ia64/ppc64/parisc64: let's deprecate
 %pF/%pf printk specifiers
Date: Fri, 22 Sep 2017 16:48:58 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F61381992@ORSMSX114.amr.corp.intel.com>
References: <20170920162910.32053-1-sergey.senozhatsky@gmail.com>
 <20170922053404.3zpfpwetabjut2er@santosiv.in.ibm.com>
 <20170922080023.GA599@jagdpanzerIV.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, "Petr Mladek" <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        "Alexei Starovoitov" <ast@kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Santosh Sivaraj <santosh@fossix.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170922080023.GA599@jagdpanzerIV.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Tested patch series on ia64 successfully.

Tested-by: Tony Luck <tony.luck@intel.com>

After this goes upstream, you should submit a patch to get rid of
all uses of %pF (70 instances in 35 files) and %pf (63 in 34)

Perhaps break the patch by top-level directory (e.g. get all the %pF
and %pF in the 17 files under drivers/ in one patch).

-Tony
