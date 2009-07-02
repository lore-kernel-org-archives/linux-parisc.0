From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Thu, 2 Jul 2009 03:48:35 GMT
Message-ID: <200907020348.n623mZPe026720@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 89ff26af79bd7ba93e5d98aa194527e55839e64a
Author: Alexander Beregalov <a.beregalov@gmail.com>
Date:   Thu Apr 16 14:45:59 2009 +0000

    parisc: superio: fix build breakage
    
    Usage of parport_pc_probe_port was changed in 28783eb52
    (parport: Fix various uses of parport_pc).
    
    It introduced this build error:
    drivers/parisc/superio.c: In function 'superio_parport_init':
    drivers/parisc/superio.c:437: error: too few arguments to function
    				'parport_pc_probe_port'
    
    Fix it.
    
    Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

