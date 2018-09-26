From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Remove PTE load and fault check from L2_ptep
 macro
Date: Wed, 26 Sep 2018 08:09:26 -0400
Message-ID: <dcb9250d-f811-90be-2c5a-4d15cb29b474@bell.net>
References: <20180926032101.GA2458@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: jejb@parisc-linux.org, Helge Deller <deller@gmx.de>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926032101.GA2458@roeck-us.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On 2018-09-25 11:21 PM, Guenter Roeck wrote:
> This patch causes my parisc qemu tests to fail.
> Unfortunately I don't have any useful log output; the failure
> is silent. Reverting the patch fixes the problem.
Can you be more specific on how to run these tests?

Dave

-- 
John David Anglin  dave.anglin@bell.net
