From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [kbuild-all] [hp-parisc:boot_devel 2/2]
 arch/powerpc/boot/inflate.c:358:18: error: 'uint32_t' undeclared
Date: Tue, 22 Aug 2017 10:06:17 +0800
Message-ID: <20170822020617.ozyt77svqpqtltfn@wfg-t540p.sh.intel.com>
References: <201708200711.P5rCbvmM%fengguang.wu@intel.com>
 <1693319.G71mkjZMyY@daneel.sf-tec.de>
 <722aa3c0-1448-df1f-d95c-a1bf6844b8c3@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>, kbuild-all@01.org,
        linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <722aa3c0-1448-df1f-d95c-a1bf6844b8c3@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On Sun, Aug 20, 2017 at 10:32:33AM +0200, Helge Deller wrote:
>On 20.08.2017 08:20, Rolf Eike Beer wrote:
>> Am Sonntag, 20. August 2017, 07:51:13 schrieb kbuild test robot:
>>> tree:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
>>> boot_devel head:   2de6ba7d548dff737bdc47173c8a7b6b20d94966
>>> commit: 2de6ba7d548dff737bdc47173c8a7b6b20d94966 [2/2] Initial support for
>>> compressed boot config: powerpc-akebono_defconfig (attached as .config)
>>> compiler: powerpc-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
>>> reproduce:
>>>         wget
>>> https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O
>>> ~/bin/make.cross chmod +x ~/bin/make.cross
>>>         git checkout 2de6ba7d548dff737bdc47173c8a7b6b20d94966
>>>         # save the attached .config to linux build tree
>>>         make.cross ARCH=powerpc
>>
>> You will not get help for powerpc problems on the parisc list.
>
>Eike, you are talking to a roboter :-)
>
>The kbuild test robot checks regularily various git trees, if the
>commits there will generate issues with other trees/architectures.
>It picked up my parisc boot-devel tree and reported build errors
>on the powerpc architecture.
>
>Please ignore this specific issue here:
>arch/powerpc/boot/inflate.c:358:18: error: 'uint32_t' undeclared
>I don't need this change and fixed it in my tree.
>
>Fengguang, can you maybe drop the parisc mailing list from
>the receiver list of issues with my trees? It just generate noise
>for the people on the mailing list.

Yes, sure. I'll remove the "mail_cc: linux-parisc@vger.kernel.org"
config option for your tree.

Thanks,
Fengguang
