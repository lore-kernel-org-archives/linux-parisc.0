From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not
 attached to the pgd
Date: Tue, 14 Jul 2015 14:09:53 +0300
Message-ID: <20150714110953.GB5835@mwanda>
References: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, deller@gmx.de, mpatocka@redhat.com,
	kirill.shutemov@linux.intel.com, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I assume you found this with Coccinelle?  Smatch can also find this bug
but you would need a cross compile environment set up.

regards,
dan carpenter

