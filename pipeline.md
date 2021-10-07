# Graphics pipeline
Notes on how the graphics pipeline works, what matrices
is involved, and which processor is doing what. This example
assumes a free-floating first person camera and a simple
model (imagine a tetrahedron or something).

The model consists of a position (x y z), a rotation
(pitch roll yaw) and a reference point (rx ry rz) in
model-space coordinates that the model is rotating around.
This gives rise to a model matrix M.

M: model space -> world space ("places" the model in the world)

The camera consists of a position (x y z) and a rotation
(pitch yaw) without roll.
This gives rise to the view matrix V. This matrix maps
world-space coordinates so that things in front of the
camera line up with the z-axis.

V: world space -> view space ("moves the world" so cam is origin)

The projection defines which volumne in front of the camera
to project down to the screen, and transforms the view space
so that things fruther away becomes smaller.

P: view space -> screen space

After we are in clip space, we need to w-normalize, and this
leaves our scene in normalized device space, where verteces
in the cube [-1, 1] x [-1, 1] x [-1, 1] are supposed to be 
visible on the screen.

This is where the indeces are used: Subsequent indeces in the
index buffer defines a line (x0 y0)-(x1 y1), which we rasterize
by running bresenham between the points.
