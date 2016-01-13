From: "Anton Wuerfel" <anton.wuerfel@fau.de>
Subject: Re: [PATCH v5 14/15] tty: serial: 8250: Add generic port init macro
Date: Wed, 13 Jan 2016 18:25:26 +0100
Message-ID: <b8289bde414e3a671306c1076cda182e.squirrel@faumail.uni-erlangen.de>
References: <1452703171-5632-1-git-send-email-anton.wuerfel@fau.de>
    <1452703171-5632-15-git-send-email-anton.wuerfel@fau.de>
    <1452705734.2521.0.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Cc: "Anton Wuerfel" <anton.wuerfel@fau.de>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Jiri Slaby" <jslaby@suse.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	"Helge Deller" <deller@gmx.de>,
	"Peter Hurley" <peter@hurleysoftware.com>,
	"Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
	"Qipeng Zha" <qipeng.zha@intel.com>,
	"Desmond Liu" <desmondl@broadcom.com>,
	"Wang Long" <long.wanglong@huawei.com>,
	"Matt Redfearn" <matt.redfearn@imgtec.com>,
	"Paul Burton" <paul.burton@imgtec.com>,
	"Ralf Baechle" <ralf@linux-mips.org>,
	"Krzysztof Kozlowski" <k.kozlowski@samsung.com>,
	"Peter Hung" <hpeter@gmail.com>,
	"Soeren Grunewald" <soeren.grunewald@desy.de>,
	"Adam Lee" <adam.lee@canonical.com>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	"Mans Rullgard" <mans@mansr.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-kernel@i4.cs.fau.de,
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1452705734.2521.0.camel@linux.intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, 2016-01-13 at 17:39 +0100, Anton Wuerfel wrote:
>> This patch removes redundant 8250 port initialization macros and
>> replaces them by a single generic base-macro, which is specialized
>> as needed.
>
> Perhaps you forgot.
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sorry, we did not even know that this tag existed. We will add this in our
next patch series.

