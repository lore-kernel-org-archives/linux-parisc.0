From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH 17/38] parisc: kernel: add missing put_device call
Date: Thu, 19 Dec 2013 07:29:25 -0800
Message-ID: <1387466965.2210.9.camel@dabdike.int.hansenpartnership.com>
References: <1387465429-3568-2-git-send-email-levex@linux.com>
	 <1387465429-3568-18-git-send-email-levex@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: LKML <linux-kernel@vger.kernel.org>, Helge Deller <deller@gmx.de>,
	Chen Gang <gang.chen@asianux.com>, linux-parisc@vger.kernel.org
To: Levente Kurusa <levex@linux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387465429-3568-18-git-send-email-levex@linux.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2013-12-19 at 16:03 +0100, Levente Kurusa wrote:
> This is required so that we give up the last reference to the device.

No, it's not.  And the subject is misleading at best, since this isn't
any form of problem in the code.

If the add fails, the device isn't visible in sysfs and no references
have been handed out.  We're perfectly entitled to follow the common
pattern of simply destroying it at this point rather than going through
the nascent refcounting.

James
