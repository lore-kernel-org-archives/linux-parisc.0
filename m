Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9CE5489B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 15 Feb 2004 20:13:01 -0700 (MST)
Date: Sun, 15 Feb 2004 20:13:00 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] C3000 video options
Message-ID: <20040216031300.GB5015@colo.lackof.org>
References: <Pine.GSO.4.44.0402142239370.12861-100000@keymaster>
	<Pine.LNX.4.58.0402150359520.22987@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0402150359520.22987@sal.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Feb 15, 2004 at 04:10:00AM +0000, M. Grabert wrote:
> HP-UX/PA-RISC doesn't use Open Firmware.

V-class uses Openboot. SPP-UX used it directly and later when HP
bought Convex, a "PDC Compat" layer was added so HPUX would boot
with fewer modifications.

If someone with access to older V-class firmware source wanted
to port that to palo, I'd think that would be an interesting project.

grant
