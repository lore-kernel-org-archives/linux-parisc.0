From: Sandra Loosemore <sandra@codesourcery.com>
Subject: Re: [committed] parisc: -mcaller-copies option
Date: Sun, 11 Dec 2016 19:22:24 -0700
Message-ID: <584E09E0.5070401@codesourcery.com>
References: <99E90516-2165-4BC3-9E46-6900C6BA8F79@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Cc: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>,
        "gcc-patches@gcc.gnu.org Patches" <gcc-patches@gcc.gnu.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <99E90516-2165-4BC3-9E46-6900C6BA8F79@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/11/2016 12:30 PM, John David Anglin wrote:

> +@item -mcaller-copies
> +@opindex mcaller-copies
> +The caller copies function arguments passed by hidden reference.  This
> +option should be used with care as it is not compatible with the default
> +32-bit runtime.  However, only aggregates larger than eight bytes are
> +passed by hidden reference and the option provides better compatibility
> +with openmp.

Please fix this to spell "OpenMP" correctly.

-Sandra

