From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: Kconfig Dependencies in Linux
Date: Fri, 17 Jan 2014 12:55:14 -0800
Message-ID: <CAP6odjg-dTix7zZKcGmaHJAptAe7wLdD+NMVrmvOcG++d506cA@mail.gmail.com>
References: <52D98D23.3010004@uwaterloo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Sarah Nadi <snadi@uwaterloo.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52D98D23.3010004@uwaterloo.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 17, 2014 at 12:05 PM, Sarah Nadi <snadi@uwaterloo.ca> wrote:
> Hi Grant,

Sarah,
If you have specific questions about Kconfig files (and the rules they
embed), my advice is to ask on linux kernel mailing list. You'll get
the answers you are looking for.

For specific projects that use the kernel, like parisc-linux or Chrome
OS (my day job), ask on those respective mailing lists:
     linux-parisc@vger.kernel.org (cc'd)
     https://groups.google.com/a/chromium.org/forum/#!forum/chromium-os-dev

Asking random people listed in MAINTAINERS is just going to get you a
lot of negative feedback.

cheers,
grant

>
> I am a researcher at the University of Waterloo, Ontario, Canada. As part of
> a research team with members from both the University of Waterloo and
> Carnegie Mellon University, USA, we are interested in creating automated
> tools for large configurable software. We are currently working on
> automatically reverse engineering configuration constraints from code to
> provide tools that support automatic creation of Kconfig dependencies (i.e.,
> the variability model) as well as consistency checks between the code and
> the variability model. We have tested our infrastructure on four different
> open-source systems. For the Linux kernel, we have already been able to
> automatically extract 31% of the Kconfig constraints from the code. We are
> currently investigating the cases we could not automatically recover to
> understand how variability modeling is used in practice, and what kind of
> constraints do developers usually enforce.
>
> To improve our tools, and to better understand the configuration constraints
> enforced, we are interested in interviewing developers who have worked with
> Kconfig.The interview would take only around 15-20 minutes of your time
> where we would discuss your related development practices, and some examples
> of Kconfig constraints we could not automatically detect. Interviews can be
> conducted over the phone or Skype. Alternatively, I can also email you a
> questionnaire if you would prefer that.
>
> Please let me know if you would be willing to participate.
>
>
> Thanks,
>
> Sarah Nadi
> PhD candidate
> University of Waterloo, ON, Canada
> http://swag.uwaterloo.ca/~snadi
