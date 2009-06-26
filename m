From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Fri, 26 Jun 2009 20:14:00 GMT
Message-ID: <200906262014.n5QKE0I3009723@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit d0a470c8ccae34b99de01fbb426d1334e383dc0d
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Fri Jun 26 17:44:18 2009 +0000

    parisc: Fix PCI resource allocation on non-PAT SBA machines
    
    We weren't marking the resources as memory resources, so they weren't
    being found by pci_claim_resource().
    
    Signed-off-by: Matthew Wilcox <willy@linux.intel.com>
    Reviewed-by: Grant Grundler <grundler@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

