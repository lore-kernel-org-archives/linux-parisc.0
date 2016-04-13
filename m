From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: PCI video card hangs during system boot
Date: Wed, 13 Apr 2016 09:06:20 +0200
Message-ID: <CACrbsaBBT20+_GtJD3XMxob7Pz+mhdw7BE0h3uQSpKq-VSOHYA@mail.gmail.com>
References: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
	<1587186.CtnrnCsSzp@caliban.sf-tec.de>
	<570D38BF.7040307@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <570D38BF.7040307@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Maybe pulling FireGL X1 will help:
> https://lists.freedesktop.org/archives/dri-users/2015-February/000034.html

Already done Dave: same error message during system boot. Just to be
clear, the error message is also indipendent by the PCI slot position.
Thanks for the hint, anyway.

My conclusion is that the "vanilla-PC" ATI RADEON 9200 128M PCI is not
"BIOS compatible" with the c8000.

Simone Mannori - ITALY
