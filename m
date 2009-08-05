From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/fixes
Date: Wed, 5 Aug 2009 00:43:36 GMT
Message-ID: <200908050043.n750haF1005683@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 582b0141b3c3b40c4757dccb4d4543ff391c1e45
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Tue Aug 4 23:59:55 2009 +0000

    parisc: add me to Maintainers
    
    It has been suggested that given my proficiency with less popular
    architectures, I should be officially listed as willing to see to the
    care and feeding of this one.
    
    Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

commit 157eac058fb0b6c6b9d973428221666fa9be87c9
Author: Julia Lawall <julia@diku.dk>
Date:   Tue Aug 4 22:27:07 2009 +0200

    parisc: arch/parisc: correct use of SHF_ALLOC
    
    SHF_ALLOC is suitable for testing against the sh_flags field, not the
    sh_type field.
    
    Signed-off-by: Julia Lawall <julia@diku.dk>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

