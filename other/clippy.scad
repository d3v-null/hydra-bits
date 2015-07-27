module clippy( frm_ht, frm_thk, top_clr, arm_thk, clp_thk, clp_ht ){
    //assert: 0 < clp_gap < 1
    
    main = [
        top_clr + frm_ht  + clp_thk,
        arm_thk + frm_thk + arm_thk,
        clp_thk
    ];
    
    difference() {
        cube(main);
        translate([
            top_clr,
            arm_thk,
            0
        ]) linear_extrude( height = main[2] ) {
            polygon([
                [0,                 0               ],
                [frm_ht,            0               ],
                [frm_ht,            clp_ht          ],
                [frm_ht + clp_thk,  0               ],
                [frm_ht + clp_thk,  frm_thk         ],
                [frm_ht,            frm_thk - clp_ht],
                [frm_ht,            frm_thk         ],
                [0,                 frm_thk         ]
            ]);
        };
    };
};

frm_thk   = 7; 
frm_ht    = 40;

clippy( frm_ht, frm_thk, 10, 4, 4, 0.25 * frm_thk);

