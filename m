Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA30073
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Dec 2000 03:25:16 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by palrel3.hp.com (Postfix) with ESMTP id 97559DAB
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Dec 2000 02:28:07 -0800 (PST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id DAA06077 for parisc-linux@puffin.external.hp.com; Fri, 15 Dec 2000 03:26:52 -0700 (MST)
Date: Fri, 15 Dec 2000 03:26:52 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200012151026.DAA06077@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


I just realized that I forgot to mention that __pthread_acquire was called by
__pthread_alt_lock, and that it is passing a pointer that has a 4 byte offset
from whatever was passed as the first argument to __pthread_alt_lock.

John
