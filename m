Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C475E4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Dec 2003 07:37:17 -0700 (MST)
Message-ID: <3FE5B04B.20107@tiscali.be>
Date: Sun, 21 Dec 2003 14:38:03 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] A small sym2 backport
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

here is a small patch resulting from my atempt to back port the new sym2 driver:
=========><=========
diff -Naur sym53c8xx_2.Orig/sym53c8xx.h sym53c8xx_2/sym53c8xx.h
--- sym53c8xx_2.Orig/sym53c8xx.h        2003-12-18 09:20:36.000000000 +0100
+++ sym53c8xx_2/sym53c8xx.h     2003-12-18 10:01:37.000000000 +0100
@@ -99,30 +96,27 @@
  /*
   *  Host template defintion
   */
-#if (LINUX_VERSION_CODE >= 0x020400) || defined(HOSTS_C) || defined(MODULE)
-
  #include <scsi/scsicam.h>

  #define SYM53C8XX {                                                    \
-       name:                   "sym53c8xx",                            \
-       detect:                 sym53c8xx_detect,                       \
-       release:                sym53c8xx_release,                      \
-       info:                   sym53c8xx_info,                         \
-       queuecommand:           sym53c8xx_queue_command,                \
-       use_new_eh_code:        1,                                      \
-       eh_abort_handler:       sym53c8xx_eh_abort_handler,             \
-       eh_device_reset_handler:sym53c8xx_eh_device_reset_handler,      \
-       eh_bus_reset_handler:   sym53c8xx_eh_bus_reset_handler,         \
-       eh_host_reset_handler:  sym53c8xx_eh_host_reset_handler,        \
-       bios_param:             scsicam_bios_param,                     \
-       can_queue:              0,                                      \
-       this_id:                7,                                      \
-       sg_tablesize:           0,                                      \
-       cmd_per_lun:            0,                                      \
-       use_clustering:         DISABLE_CLUSTERING,                     \
-       highmem_io:             1}
-
-#endif /* defined(HOSTS_C) || defined(MODULE) */
+       .name                   = "sym53c8xx",                          \
+       .detect                 = sym53c8xx_detect,                     \
+       .release                = sym53c8xx_release,                    \
+       .info                   = sym53c8xx_info,                       \
+       .queuecommand           = sym53c8xx_queue_command,              \
+       .use_new_eh_code        = 1,                                    \
+       .eh_abort_handler       = sym53c8xx_eh_abort_handler,           \
+       .eh_device_reset_handler= sym53c8xx_eh_device_reset_handler,    \
+       .eh_bus_reset_handler   = sym53c8xx_eh_bus_reset_handler,       \
+       .eh_host_reset_handler  = sym53c8xx_eh_host_reset_handler,      \
+       .bios_param             = scsicam_bios_param,                   \
+       .can_queue              = 0,                                    \
+       .this_id                = 7,                                    \
+       .sg_tablesize           = 0,                                    \
+       .cmd_per_lun            = 0,                                    \
+       .use_clustering         = DISABLE_CLUSTERING,                   \
+       .highmem_io             = 1                                     \
+}

  /*
   *  Translate kernel configuration parameters
@@ -292,27 +286,26 @@
   *
   *  Can be overriden at startup by a command line.
   */
-#define SYM_LINUX_DRIVER_SETUP                 \
-{                                              \
-       1,      /* pci_parity */                \
-       1,      /* scsi_parity */               \
-       CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS,     \
-       CONFIG_SCSI_SYM53C8XX_DEFAULT_SYNC,     \
-       7,      /* burst_order */               \
-       1,      /* scsi_led */                  \
-       1,      /* max_wide */                  \
-       1,      /* scsi_diff */                 \
-       0,      /* irq_mode */                  \
-       1,      /* scsi_bus_check */            \
-       7,      /* host_id */                   \
-       62,     /* max_offs */                  \
-       CONFIG_SCSI_SYM53C8XX_MAX_LUN,          \
-       3,      /* pci_fix_up */                \
-       0,      /* reverse_probe */             \
-       0,      /* verbose */                   \
-       0,      /* debug */                     \
-       3,      /* settle_delay */              \
-       1,      /* use_nvram */                 \
+#define SYM_LINUX_DRIVER_SETUP {                                       \
+       .pci_parity     = 1,                                    \
+       .scsi_parity    = 1,                                    \
+       .max_tag        = CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS,   \
+       .min_sync       = CONFIG_SCSI_SYM53C8XX_DEFAULT_SYNC,   \
+       .burst_order    = 7,                                    \
+       .scsi_led       = 1,                                    \
+       .max_wide       = 1,                                    \
+       .scsi_diff      = 1,                                    \
+       .irq_mode       = 0,                                    \
+       .scsi_bus_check = 1,                                    \
+       .host_id        = 7,                                    \
+       .max_offs       = 62,                                   \
+       .max_lun        = CONFIG_SCSI_SYM53C8XX_MAX_LUN,        \
+       .pci_fix_up     = 3,                                    \
+       .reverse_probe  = 0,                                    \
+       .verbose        = 0,                                    \
+       .debug          = 0,                                    \
+       .settle_delay   = 3,                                    \
+       .use_nvram      = 1,                                    \
  }

  /*
@@ -321,27 +314,26 @@
   *  Override initial setup from boot command line:
   *    sym53c8xx=safe:y
   */
-#define SYM_LINUX_DRIVER_SAFE_SETUP            \
-{                                              \
-       0,      /* pci_parity */                \
-       0,      /* scsi_parity */               \
-       0,      /* max_tag */                   \
-       50,     /* min_sync */                  \
-       0,      /* burst_order */               \
-       0,      /* scsi_led */                  \
-       1,      /* max_wide */                  \
-       1,      /* scsi_diff */                 \
-       0,      /* irq_mode */                  \
-       2,      /* scsi_bus_check */            \
-       7,      /* host_id */                   \
-       15,     /* max_offs */                  \
-       1,      /* max_lun */                   \
-       0,      /* pci_fix_up */                \
-       0,      /* reverse_probe */             \
-       2,      /* verbose */                   \
-       0,      /* debug */                     \
-       10,     /* settle_delay */              \
-       1,      /* use_nvram */                 \
+#define SYM_LINUX_DRIVER_SAFE_SETUP {                          \
+       .pci_parity     = 0,                                    \
+       .scsi_parity    = 0,                                    \
+       .max_tag        = 0,                                    \
+       .min_sync       = 50,                                   \
+       .burst_order    = 0,                                    \
+       .scsi_led       = 0,                                    \
+       .max_wide       = 1,                                    \
+       .scsi_diff      = 1,                                    \
+       .irq_mode       = 0,                                    \
+       .scsi_bus_check = 2,                                    \
+       .host_id        = 7,                                    \
+       .max_offs       = 15,                                   \
+       .max_lun        = 1,                                    \
+       .pci_fix_up     = 0,                                    \
+       .reverse_probe  = 0,                                    \
+       .verbose        = 2,                                    \
+       .debug          = 0,                                    \
+       .settle_delay   = 10,                                   \
+       .use_nvram      = 1,                                    \
  }

  /*
=========><=========

I test it against 2.4.23-pa3 on my c110 and b2k and seems Ok.

If there is still some interest fill free to ci (i don't have cvs access)

hth,
	Joel
