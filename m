Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] rtc doesn't build 
In-Reply-To: Message from "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
   of "Tue, 12 Nov 2002 18:57:07 GMT." <Pine.BSF.4.44.0211121854470.32930-100000@e0-0.zab2.int.zabbadoz.net>
References: <Pine.BSF.4.44.0211121854470.32930-100000@e0-0.zab2.int.zabbadoz.net> 
Date: Tue, 12 Nov 2002 12:04:26 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021112190427.F11C14829@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"Bjoern A. Zeeb" wrote:
> thi sseems to be a problem with nonexistent defines expected
> to be in include/asm-parisc/mc146818rtc.h

use GENRTC instead

grant
