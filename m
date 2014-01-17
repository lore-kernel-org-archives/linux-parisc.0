From: Sarah Nadi <snadi@uwaterloo.ca>
Subject: Re: Kconfig Dependencies in Linux
Date: Fri, 17 Jan 2014 16:03:34 -0500
Message-ID: <52D99AA6.7080902@uwaterloo.ca>
References: <52D98D23.3010004@uwaterloo.ca> <CAP6odjg-dTix7zZKcGmaHJAptAe7wLdD+NMVrmvOcG++d506cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Grant Grundler <grantgrundler@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAP6odjg-dTix7zZKcGmaHJAptAe7wLdD+NMVrmvOcG++d506cA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Grant,

Thanks for your feedback. I was actually specifically targetting 
developers who have committed to the Kconfig files before as far as I 
could tell from the  kernel's git repository rather than randomly 
picking people listed in MAINTAINERS. I do have questions about certain 
dependencies, but I also want to get the general intuition behind when a 
Kconfig dependency is enforced, and if there is external/domain 
knowledge that comes into play. This is why I was interested in talking 
to developers.

In all cases, I do appreciate the advice!

Sarah

On 14-01-17 03:55 PM, Grant Grundler wrote:
> On Fri, Jan 17, 2014 at 12:05 PM, Sarah Nadi <snadi@uwaterloo.ca> wrote:
>> Hi Grant,
> Sarah,
> If you have specific questions about Kconfig files (and the rules they
> embed), my advice is to ask on linux kernel mailing list. You'll get
> the answers you are looking for.
>
> For specific projects that use the kernel, like parisc-linux or Chrome
> OS (my day job), ask on those respective mailing lists:
>       linux-parisc@vger.kernel.org (cc'd)
>       https://groups.google.com/a/chromium.org/forum/#!forum/chromium-os-dev
>
> Asking random people listed in MAINTAINERS is just going to get you a
> lot of negative feedback.
>
> cheers,
> grant
>

