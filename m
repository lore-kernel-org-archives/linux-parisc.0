Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FE9A485A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Apr 2004 11:08:05 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3GH82a24662; Fri, 16 Apr 2004 13:08:03 -0400
Subject: Re: [parisc-linux] preliminary patches to speed up fork/exec
From: James Bottomley <James.Bottomley@steeleye.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
In-Reply-To: <1082134752.2357.21.camel@mulgrave>
References: <1082134752.2357.21.camel@mulgrave>
Content-Type: text/plain
Date: 16 Apr 2004 12:08:02 -0500
Message-Id: <1082135283.2130.23.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 2004-04-16 at 11:59, James Bottomley wrote:
> This is against 2.6.5-pa8 (there may be problems in 2.6.6-rc1 because of
> the VM changes).

The patch actually only works on a 64 bit kernel, currently, too.

James
