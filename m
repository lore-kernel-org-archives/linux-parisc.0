Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 402144829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 05:27:25 -0700 (MST)
Received: from xparelay1.ptp.hp.com (xparelay1.ptp.hp.com [15.1.28.62])
	by palrel11.hp.com (Postfix) with ESMTP id F1479600BED
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 04:27:16 -0800 (PST)
Received: from xpabh3.ptp.hp.com (xpabh3.ptp.hp.com [15.1.28.63])
	by xparelay1.ptp.hp.com (Postfix) with ESMTP id D99C5E00368
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 04:27:16 -0800 (PST)
Message-ID: <9A0482A7BD2506488AD9417C93F3714FC27735@xsp01.brazil.hp.com>
From: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
To: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 13 Dec 2002 04:27:13 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] fic problem
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

Hi people,

	I have an error with the use of fic asm instruction(see piece code
below). 
            I'm ask you if you have a tip do help me to solve this problem.

       buf = (char *)malloc(4096);
        if(!buf)
        {
                printf("\n malloc error!");
                return(1);
        }


        /* copy instr stream(s) to new page */
        start = (unsigned int *)&(label of an asm code);
        spot = (unsigned int *)buf;
        end = (unsigned int *)&(label of an asm code);

        while(start <= end)
        {
                *spot = *start;
                __asm__ __volatile__("fdc (%0)" :: "r" (spot) );
                __asm__ __volatile__("sync" ::);
                __asm__ __volatile__("fic (%0)" :: "r" (spot) );
(segmentation fault in this line)
                __asm__ __volatile__("sync" ::);
                spot++;
                start++;
        }

Thanks in advance,

-----------------------------------------------------------------------
              Leandro Marcondes Farinati
                    Software Developer

*   leandro.farinati@hp.com
